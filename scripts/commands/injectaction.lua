-----------------------------------
--	[Command name]: injectaction
--	[Author      ]:
--	[Description ]: Injects an action packet with the specified action and animation id.
-----------------------------------

-----------------------------------
-- ActionTypes:
-- 3 weaponskill
-- 4 magic
-- 6 jobability
-- 11 mob ability
-- AnimationIds you can find in weaponskills.sql, mob_skills etc.
--
-- Example:
-- @injectaction <actionType> <animationId>
--
-----------------------------------

function onTrigger(player,action,anim)
	player:injectActionPacket(action,anim);
end;