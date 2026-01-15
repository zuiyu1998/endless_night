extends CharacterBody2D
class_name Unit
## 基类

@onready var skill_component: SkillComponent = $SkillComponent
@onready var skill_system_proxy: SkillSystemProxy = $SkillSystemProxy

func get_system_proxy() -> SkillSystem:
	return skill_system_proxy.get_skill_system()
	
