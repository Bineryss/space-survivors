extends Node
class_name StatisticsService

enum StatisticName {
	SHOOTS_FIRED,
	ENEMIES_KILLED,
	PICKUPS_COLLECTED,
}

var stats: Dictionary[StatisticName, float]

func _ready() -> void:
	SignalBus.statistic_changed.connect(_on_stat_changed)

func _on_stat_changed(stat_name: StatisticName, new_value: float) -> void:
	if stats.has(stat_name):
		stats[stat_name] += new_value
	else:
		stats[stat_name] = new_value