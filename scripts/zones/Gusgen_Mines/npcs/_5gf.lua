-----------------------------------
-- Area: Gusgen Mines
--  NPC: _5gf (Lever C)
-- !pos 44 -40.561 -54.199 196
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    --local nID = npc:getID();
    -- printf("id: %u", nID);

    local Lever = npc:getID();

    npc:openDoor(2); -- Lever animation
    if (GetNPCByID(Lever-6):getAnimation() == 9) then
        GetNPCByID(Lever-8):setAnimation(9);--close door F
        GetNPCByID(Lever-7):setAnimation(9);--close door E
        GetNPCByID(Lever-6):setAnimation(8);--open door D
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;