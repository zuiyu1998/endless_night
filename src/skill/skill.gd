extends Resource
class_name Skill
## 技能

# 技能名称
@export
var skill_name: StringName = &""

# 技能效果
@export
var effects: Array[SkillEffect] = []
