-----------------------------------
--	[Command name]: animatenpc
--	[Author      ]: PrBlahBlahtson
--	[Description ]: Changes the animation of an NPC for testing purposes.
-----------------------------------

-- Usage: @animatenpc npcid value

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player, npc, anim)

	if (npc ~= nil and anim ~= nil) then
        local oldanim = GetNPCByID(npc):getAnimation();
        GetNPCByID(npc):setAnimation(anim);
        --printf("NPC ID: %i | Old animation: %i | New animation: %i\n", npc, oldanim, anim);
		player:PrintToPlayer(string.format("NPC ID: %i | Old animation: %i | New animation: %i\n", npc, oldanim, anim));
    end

end;