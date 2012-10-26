-----------------------------------
--	[Command name]: setmerits
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,quantity)

	if(quantity>0 and quantity<=10) then
		player:setMerits(quantity);
	else
		print('Merits (2nd param) must be between 1~10'); 
	end
end;