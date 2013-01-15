-----------------------------------
--	[Command name]: give key item to player
--	[Author      ]: link
--	[Description ]: will give key item to player
--
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,keyID)

	pc = GetPlayerByName(target);

    if (pc ~= nil) then
        local TextIDs = "scripts/zones/" .. pc:getZoneName() .. "/TextIDs";
        package.loaded[TextIDs] = nil;
        require(TextIDs);

        pc:addKeyItem(keyID);
        pc:messageSpecial(KEYITEM_OBTAINED,keyID);
    end
end;