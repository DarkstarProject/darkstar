-----------------------------------
--  Area: Grauberg [S]
--  NPC:  ???
--  Quest - Fires of Discontent
-- pos 258 33 516
-----------------------------------
package.loaded["scripts/zones/Grauberg_[S]/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/harvesting");
require("scripts/zones/Grauberg_[S]/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_ACCEPTED) then
        if (player:getVar("FiresOfDiscProg") == 3) then
            player:startEvent(0x000B);
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    
    if (csid==0x000B) then
        player:setVar("FiresOfDiscProg",4);
    end

end;