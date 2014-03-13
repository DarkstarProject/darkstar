-----------------------------------
--  Area: Windurst Woods
--  NPC:  Nikkoko
--  Type: Clothcraft Image Support
--  @pos -32.810 -3.25 -113.680 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/status");
require("scripts/globals/crafting");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local guildMember = isGuildMember(player,3);
    local SkillCap = getCraftSkillCap(player,8);
    local SkillLevel = player:getSkillLevel(8);
    
    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY) == false) then
			player:startEvent(0x271E,SkillCap,SkillLevel,1,511,player:getGil(),0,4095,0); -- p1 = skill level
	    else
            player:startEvent(0x271E,SkillCap,SkillLevel,1,511,player:getGil(),7101,4095,0);
	    end
	else
        player:startEvent(0x271E); -- Standard Dialogue
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x271E and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,4,1);
        player:addStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY,1,0,120);
    end
end;




