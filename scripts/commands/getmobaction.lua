---------------------------------------------------------------------------------------------------
-- func: getmobaction
-- desc: Prints mob's current action to the command user.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, mob)

    if (mob ~= nil) then
        if (mob > 16780000) then
            local action = GetMobAction(mob);
            local name = GetMobByID(mob):getName();

            player:PrintToPlayer(string.format("Mob ID: %i | Mob Name: %s | Action ID: %i \n",mob,name,action));
        else
            player:PrintToPlayer(string.format("Invalid Mob ID %i ! \n", mob));
        end
    else
            player:PrintToPlayer(string.format("Mob ID cannot be blank!"));
    end
end;