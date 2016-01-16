---------------------------------------------------------------------------------------------------
-- func: @reloadglobal
-- desc: Attempt to reload specified global lua without a restart.
--
-- Use with caution, some files ( like player.lua )
-- can cause you problems if you reload them using this.
-- This command expects the user to know wtf they are doing,
-- but has a default permission lv of 4 so that helpers or
-- less experienced GMs do not mistakenly misuse it.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "s"
};

function onTrigger(player,globalLua)

    if (globalLua == "player" or globalLua == "server" ) then
        player:PrintToPlayer( "Some file should not be live reloaded. This is one of them." );
        return
    end

    if (globalLua ~= nil) then
        local String = table.concat({"scripts/globals/",globalLua});
        package.loaded[String] = nil;
        require(String);
        player:PrintToPlayer( string.format( "Lua file '%s' has been reloaded.", String ) );
    else
        player:PrintToPlayer( "Must Specify a global lua file.");
    end

end;