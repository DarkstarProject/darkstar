-----------------------------------
-- Area: Den of Rancor
-- NPC:  Switch
-- @pos -56 45 40 160
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getZPos() > 35) then
        GetNPCByID(17433051):openDoor(); -- drop gate to Sacrificial Chamber
    end
end;
