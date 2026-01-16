extends Node

signal player_died
signal player_hurt(amount: int)
signal enemy_destroyed(position: Vector2)
signal pickup_collected
signal statistic_changed(stat_name: StatisticsService.StatisticName, new_value: float)