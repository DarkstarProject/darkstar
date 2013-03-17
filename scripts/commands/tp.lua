-----------------------------------
--	[Command name]: tp
--	[Author      ]:
--	[Description ]:
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,tp)
    player:setTP(tp);

    -- set pet tp too
    local pet = player:getPet();
    if(pet ~= nil) then
    	pet:setTP(tp);
    end
end;