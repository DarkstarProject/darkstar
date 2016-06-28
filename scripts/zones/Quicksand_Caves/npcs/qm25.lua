-----------------------------------
--    Area: Quicksand Caves
--     NPC:  qm25
--  Notes: Antican Tag
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local newPosition = npcUtil.pickNewPosition(npc:getID(), anticanTagPositions);

    if (player:getFreeSlotsCount() == 0) then
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1190);
    else
        if (player:addItem(1190)) then
            npc:hideNPC(7200);
            npc:setPos(anticanTagPositions[newPosition][1], anticanTagPositions[newPosition][2], anticanTagPositions[newPosition][3]);
            player:messageSpecial(ITEM_OBTAINED, 1190);
            SetServerVariable("[POP]Antican_Tag", os.time(t) + 7200); -- "pause" UpdateAnticanTagSpawnPoint
        end
    end
end;
