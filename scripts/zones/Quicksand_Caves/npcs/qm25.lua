-----------------------------------
-- Area: Quicksand Caves
--  NPC:  qm25
--  Notes: Antican Tag
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local newPosition = npcUtil.pickNewPosition(npc:getID(), anticanTagPositions, true);

    if (player:getFreeSlotsCount() == 0) then
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1190);
    else
        if (player:addItem(1190)) then
            npc:hideNPC(7200);
            npc:setPos(newPosition.x, newPosition.y, newPosition.z);
            player:messageSpecial(ITEM_OBTAINED, 1190);
            SetServerVariable("[POP]Antican_Tag", os.time(t) + 7200); -- "pause" UpdateNPCSpawnPoint
        end
    end
end;
