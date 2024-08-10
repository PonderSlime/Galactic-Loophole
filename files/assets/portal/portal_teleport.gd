extends Area3D
class_name PortalTeleport

var _parent_portal:Portal

func _ready():
	_parent_portal = get_parent() as Portal
	if _parent_portal == null:
		push_error("The PortalTeleport \"%s\" is not a child of a Portal instance" % name)
	
	connect("area_entered", _on_area_entered)

func _on_area_entered(area:Area3D):
	if area.has_meta("teleportable_root"):
		var root:Node3D = area.get_node(area.get_meta("teleportable_root"))
		root.global_transform = _parent_portal.real_to_exit_transform(root.global_transform)
		var cam:Camera3D = root.get_node("Camera")
		cam.rotation.x = root.rotation.x
		
		root.rotation.z = 0
		await get_tree().create_timer(0.001).timeout
		root.rotation.x = 0
		print("zoom!")
