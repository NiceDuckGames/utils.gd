class_name Utils extends Object


static func get_all_children(node: Node) -> Array[Node]:
	var nodes: Array[Node] = []
	
	for c in node.get_children():
		nodes.append(c)
		if c.get_child_count() > 0:
			nodes.append(get_all_children(c))
	
	return nodes

static func add_all_children_to_group(node: Node, group: String) -> void:
	var nodes: Array[Node] = get_all_children(node)
	for n in nodes:
		n.add_to_group(group)

static func has_group_partial(node: Node, substring: String) -> bool:
	## checks all the groups of a node for the given substring and returns true on the first match
	## false otherwise.
	var groups: Array[StringName] = node.get_groups()
	for g in groups:
		if g.contains(substring):
			return true
	return false
	
static func get_scene_root(node: Node) -> Node:
	return node.get_tree().root.get_child(0)
