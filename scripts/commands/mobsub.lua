-----------------------------------
--	[Command name]: mobsub
--	[Author      ]: PrBlahBlahtson
--	[Description ]: Changes the animationsub of a mob for testing purposes.
-----------------------------------

-- Usage: @mobsub mobid value
-- Values should be 0-3.
-- Command has been hard limited to prevent possible overflow issues.  No mobs seem to respond uniquely to 4+ yet.

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player, target, anim)
	local mob = GetMobByID(target);
	if (mob ~= nil) and (anim ~= nil and anim < 4) then
		GetMobByID(target):AnimationSub(anim);
	end
end;