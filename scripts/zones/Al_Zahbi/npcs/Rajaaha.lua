-----------------------------------
--  Area: Al Zahbi
--  NPC:  Rajaaha
--  Type: Goldsmithing Normal/Adv. Image Support
--  @pos 49.9 0.1 -45.2 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/status");
require("scripts/globals/crafting");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local guildMember = isGuildMember(player,6);

    if (guildMember == 1) then
        if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
            if (player:hasStatusEffect(EFFECT_GOLDSMITHING_IMAGERY) == false) then
                player:tradeComplete();
                player:startEvent(0x00E7,8,0,0,0,188,0,3,0);
            else
                npc:showText(npc, IMAGE_SUPPORT_ACTIVE);
            end
        end
    end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,6);
    local SkillLevel = player:getSkillLevel(SKILL_GLD);
    
	if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_GOLDSMITHING_IMAGERY) == false) then
			player:startEvent(0x00E6,8,SkillLevel,0,511,188,0,3,2184);
	    else
            player:startEvent(0x00E6,8,SkillLevel,0,511,188,7101,3,2184);
	    end
	else
        player:startEvent(0x00E6,0,0,0,0,0,0,3,0); -- Standard Dialogue
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

    if (csid == 0x00E6 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,3,1);
		player:addStatusEffect(EFFECT_GOLDSMITHING_IMAGERY,1,0,120);
    elseif (csid == 0x00E7) then
        player:messageSpecial(IMAGE_SUPPORT,0,3,0);
		player:addStatusEffect(EFFECT_GOLDSMITHING_IMAGERY,3,0,480);    
    end
end;





