-----------------------------------
--	[Command name]: addspell
--	[Author      ]: Wolke
--	[Description ]: @addspell <id> adds the ability to use a spell to the player
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,id)
	player:addSpell(id);
end;