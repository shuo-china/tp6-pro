<?php

namespace app\admin\controller;

use app\admin\model\Menu;
use think\facade\Db;

class MenuController extends BaseController
{
    public function tree()
    {
        $list = Menu::order('order asc')->select()->toArray();
        $this->success(200, $this->buildTree($list));
    }

    public function create()
    {
        $post = $this->request->post();
        $this->validate($post, 'Menu');
        Menu::create($post);
        $this->success(201);
    }

    public function update()
    {
        $post = $this->request->post();
        $this->validate($post, 'Menu');

        if ((int) $post['parent_id'] === (int) $post['id']) {
            $this->error(400, '上级菜单不能选择自身');
        }

        if ($this->isDescendant((int) $post['id'], (int) $post['parent_id'])) {
            $this->error(400, '上级菜单不能选择当前菜单的子菜单');
        }

        Menu::update($post);
        $this->success(201);
    }

    public function sort()
    {
        $menus = $this->request->post('menus', []);

        if (!is_array($menus)) {
            $this->error(400, '菜单排序数据格式错误');
        }

        Db::transaction(function () use ($menus) {
            foreach ($menus as $menu) {
                Menu::where('id', (int) $menu['id'])->update([
                    'parent_id' => (int) $menu['parent_id'],
                    'order' => (int) $menu['order'],
                ]);
            }
        });

        $this->success(201);
    }

    public function delete()
    {
        $id = (int) $this->request->param('id');
        $menu = Menu::find($id);
        if (!$menu) {
            $this->error(404, '菜单不存在');
        }

        Menu::whereIn('id', $this->getDescendantIds($id))->delete();
        $this->success(204);
    }

    private function buildTree(array $list, int $parentId = 0): array
    {
        $tree = [];

        foreach ($list as $item) {
            if ((int) $item['parent_id'] !== $parentId) {
                continue;
            }

            $children = $this->buildTree($list, (int) $item['id']);
            if ($children) {
                $item['children'] = $children;
            }

            $tree[] = $item;
        }

        return $tree;
    }

    private function isDescendant(int $id, int $parentId): bool
    {
        if ($parentId === 0) {
            return false;
        }

        return in_array($parentId, $this->getDescendantIds($id), true);
    }

    private function getDescendantIds(int $id): array
    {
        $ids = [$id];
        $children = Menu::where('parent_id', $id)->column('id');

        foreach ($children as $childId) {
            $ids = array_merge($ids, $this->getDescendantIds((int) $childId));
        }

        return $ids;
    }
}
