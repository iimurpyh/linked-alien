extends Panel

var karma: int = 0

@onready var karma_label = $KarmaLabel
@onready var add_karma_btn = $AddKarmaBtn
@onready var open_store_btn = $OpenKarmaStoreBtn
@onready var karma_store_panel = get_node("../KarmaStorePanel")
@onready var close_store_btn = get_node("../KarmaStorePanel/CloseBtn")

func _ready():
	add_karma_btn.pressed.connect(_on_add_karma_pressed)
	open_store_btn.pressed.connect(_on_open_store_pressed)
	close_store_btn.pressed.connect(_on_close_store_pressed)
	update_karma_display()

func _on_add_karma_pressed():
	karma += 1
	update_karma_display()
	print("Karma increased to: ", karma)

func _on_open_store_pressed():
	karma_store_panel.visible = true
	print("Karma Store opened")

func _on_close_store_pressed():
	karma_store_panel.visible = false
	print("Karma Store closed")

func update_karma_display():
	karma_label.text = "Karma: " + str(karma)
