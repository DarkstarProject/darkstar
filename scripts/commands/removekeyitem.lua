-----------------------------------
--	[Command name]: remove key item from a player
--	[Author      ]: link
--	[Description ]: will remove a keyitem from player
--
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,keyID)

	pc = GetPlayerByName(target);

	pc:delKeyItem(keyID);
	pc:messageSpecial(KEYITEM_OBTAINED+1,keyID);

end;