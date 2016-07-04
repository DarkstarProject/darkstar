-----------------------------------
-- Area: Arrapago Reef
-- Door: Cutter
-- @pos -450 -10 -400 z 54
-----------------------------------

package.loaded["scripts/zones/The_Ashu_Talif/TextIDs"] = nil;
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/zones/Arrapago_Reef/TextIDs");
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/besieged");
require("scripts/zones/The_Ashu_Talif/TextIDs");



-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	 local assaultid = 53;
	 
		print("it")
	    player:startEvent(0x00DD, 53, -6, 0, 99, 6, 0);
  printf("assault %u",assaultid)

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,target)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);

    local assaultid = player:getCurrentAssault();
       local cap = 99;
    player:setVar("AssaultCap", cap);
    local party = player:getParty();
   
	
	    if (party ~= nil) then
        for i,v in ipairs(party) do
            if (not (v:getVar("TOAUM15") ==1)) then
                player:messageText(target,MEMBER_NO_REQS, false);
                player:instanceEntry(target,1);
								print("cecasla")

                return;
            elseif (v:getZone() == player:getZone() and v:checkDistance(player) > 50) then
                player:messageText(target,MEMBER_TOO_FAR, false);
                player:instanceEntry(target,1);
								print("celuici")

                return;
            end
        end
    end
    player:createInstance(53, 60);
	printf("instance creee")
    
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
 
    if (csid == 0xDE or(csid == 0xDD and option == 4)) then
        player:setPos(0,0,0,0,60);
    end
end;

-----------------------------------
-- onInstanceLoaded
-----------------------------------

function onInstanceCreated(player,target,instance)

    if (instance) then
		printf("testblahblaggtjrzioe")
        instance:setLevelCap(player:getVar("AssaultCap"));
        player:setVar("AssaultCap", 0);
        player:setInstance(instance);
        player:instanceEntry(target,4);
printf("instance %s",player:getInstance());
		

        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZone() == player:getZone() then
                    v:setInstance(instance);
					v:startEvent(0xDE, 6);
                    
                end
            end
        end
    else
		
        player:messageText(target,CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;