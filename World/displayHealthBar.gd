extends TextureProgressBar

@onready var player =  $"../../Player"

func _ready():
	player.healthChanged.connect(self.updateHealth)
	player.playerDeath.connect(self.deathSequence) # the signals
	updateHealth()

func updateHealth():
	
	value = player.health / 2
	
func deathSequence():
	get_tree().paused = true
	print("GAME OVER")

