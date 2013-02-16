-----------------------------------
--	[Command name]: hp
--	[Author      ]:
--	[Description ]:
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,hp)
    if(player:getHP() > 0) then
    	player:setHP(hp);
    end
end;