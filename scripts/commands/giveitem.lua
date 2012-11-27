-----------------------------------
--	[Command name]: give item to player
--	[Author      ]: link
--	[Description ]: will give item to player
--
--	(@giveitem Link 17440) will give link 1 kraken club
--	(@giveitem Link 1179 99) will give link 99x shihei
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,itemID,quantity)
	pc = GetPlayerByName(target);
	pc:addItem(itemID,quantity);
end;