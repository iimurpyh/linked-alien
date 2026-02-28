extends Node2D

var karma: int = 0
var image_search_unlocked: bool = false
var connections_unlocked: bool = false
var activity_log_unlocked: bool = false

@onready var home_btn = $UI/Window/App/Webpage/MenuBar/Home
@onready var jobs_btn = $UI/Window/App/Webpage/MenuBar/Jobs
@onready var messages_btn = $UI/Window/App/Webpage/MenuBar/Messages
@onready var store_btn = $UI/Window/App/Webpage/MenuBar/Store

@onready var stats_panel = $UI/Window/App/StatsPanel
@onready var karma_label = $UI/Window/App/StatsPanel/MarginContainer/VBoxContainer/KarmaLabel
@onready var add_karma_btn = $UI/Window/App/StatsPanel/MarginContainer/VBoxContainer/AddKarmaBtn
@onready var karma_store_panel = $UI/Window/App/KarmaStorePanel
@onready var close_store_btn = $UI/Window/App/KarmaStorePanel/CloseBtn
@onready var claim_image_search_btn = $UI/Window/App/KarmaStorePanel/StoreContent/ClaimImageSearchBtn
@onready var claim_connections_btn = $UI/Window/App/KarmaStorePanel/StoreContent/ClaimConnectionsBtn
@onready var claim_activity_log_btn = $UI/Window/App/KarmaStorePanel/StoreContent/ClaimActivityLogBtn

@onready var reverse_image_search_btn = $UI/Window/App/ToolkitPanel/MarginContainer/VBoxContainer/ReverseImageSearchBtn
@onready var view_connections_btn = $UI/Window/App/ToolkitPanel/MarginContainer/VBoxContainer/ViewConnectionsBtn
@onready var scan_profile_btn = $UI/Window/App/ToolkitPanel/MarginContainer/VBoxContainer/ScanProfileBtn

func _ready():
	# Connect karma buttons
	add_karma_btn.pressed.connect(_on_add_karma_pressed)
	close_store_btn.pressed.connect(_on_close_store_pressed)
	store_btn.pressed.connect(_on_store_pressed)
	claim_image_search_btn.pressed.connect(_on_claim_image_search_pressed)
	claim_connections_btn.pressed.connect(_on_claim_connections_pressed)
	claim_activity_log_btn.pressed.connect(_on_claim_activity_log_pressed)
	
	# Connect menu buttons
	home_btn.pressed.connect(_on_home_pressed)
	jobs_btn.pressed.connect(_on_jobs_pressed)
	messages_btn.pressed.connect(_on_messages_pressed)

	update_investigation_tool_visibility()
	update_store_buttons()
	update_karma_display()

func _on_add_karma_pressed():
	karma += 1
	update_karma_display()
	update_store_buttons()
	print("Karma increased to: ", karma)

func _on_claim_image_search_pressed():
	if image_search_unlocked:
		return
	if karma >= 20:
		image_search_unlocked = true
		update_investigation_tool_visibility()
		update_store_buttons()
		print("Image Search unlocked")

func _on_claim_connections_pressed():
	if connections_unlocked:
		return
	if karma >= 40:
		connections_unlocked = true
		update_investigation_tool_visibility()
		update_store_buttons()
		print("Connections unlocked")

func _on_claim_activity_log_pressed():
	if activity_log_unlocked:
		return
	if karma >= 60:
		activity_log_unlocked = true
		update_investigation_tool_visibility()
		update_store_buttons()
		print("Activity Logs unlocked")

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

func update_investigation_tool_visibility():
	reverse_image_search_btn.visible = image_search_unlocked
	view_connections_btn.visible = connections_unlocked
	scan_profile_btn.visible = activity_log_unlocked

func update_store_buttons():
	if image_search_unlocked:
		claim_image_search_btn.disabled = true
		claim_image_search_btn.text = "Image Search (Claimed)"
	else:
		claim_image_search_btn.disabled = karma < 20
		claim_image_search_btn.text = "Claim Image Search (20 Karma)"

	if connections_unlocked:
		claim_connections_btn.disabled = true
		claim_connections_btn.text = "Connections (Claimed)"
	else:
		claim_connections_btn.disabled = karma < 40
		claim_connections_btn.text = "Claim Connections (40 Karma)"

	if activity_log_unlocked:
		claim_activity_log_btn.disabled = true
		claim_activity_log_btn.text = "Activity Logs (Claimed)"
	else:
		claim_activity_log_btn.disabled = karma < 60
		claim_activity_log_btn.text = "Claim Activity Logs (60 Karma)"
