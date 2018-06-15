-----------------------------------
-- ???
-- WOGT Quest
-- !pos 150 -39 331 95
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/West_Sarutabaruta_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS)==QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.SMALL_STARFRUIT)==false) then
        player:addKeyItem(dsp.ki.SMALL_STARFRUIT);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.SMALL_STARFRUIT);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

end;