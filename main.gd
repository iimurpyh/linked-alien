extends Node2D

var karma: int = 0

@onready var home_btn = $UI/Window/App/Webpage/MenuBar/Home
@onready var jobs_btn = $UI/Window/App/Webpage/MenuBar/Jobs
@onready var messages_btn = $UI/Window/App/Webpage/MenuBar/Messages
@onready var store_btn = $UI/Window/App/Webpage/MenuBar/Store

@onready var stats_panel = $UI/Window/App/StatsPanel
@onready var karma_label = $UI/Window/App/StatsPanel/MarginContainer/VBoxContainer/KarmaLabel
@onready var add_karma_btn = $UI/Window/App/StatsPanel/MarginContainer/VBoxContainer/AddKarmaBtn
@onready var karma_store_panel = $UI/Window/App/KarmaStorePanel
@onready var close_store_btn = $UI/Window/App/KarmaStorePanel/CloseBtn

func _ready():
	# Connect karma buttons
	add_karma_btn.pressed.connect(_on_add_karma_pressed)
	close_store_btn.pressed.connect(_on_close_store_pressed)
	store_btn.pressed.connect(_on_store_pressed)
	
	# Connect menu buttons
	home_btn.pressed.connect(_on_home_pressed)
	jobs_btn.pressed.connect(_on_jobs_pressed)
	messages_btn.pressed.connect(_on_messages_pressed)
	
	update_karma_display()

func _on_add_karma_pressed():
	karma += 1
	update_karma_display()
	print("Karma increased to: ", karma)

func _on_store_pressed():
	karma_store_panel.visible = true
	print("Karma Store opened")

func _on_close_store_pressed():
	karma_store_panel.visible = false
	print("Karma Store closed")

func _on_home_pressed():
	print("Home clicked")

func _on_jobs_pressed():
	print("Jobs clicked")

func _on_messages_pressed():
	print("Messages clicked")

func update_karma_display():
	karma_label.text = "Karma: " + str(karma)
