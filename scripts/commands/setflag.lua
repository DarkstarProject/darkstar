---------------------------------------------------------------------------------------------------
-- func: @setflag <flags> <target>
-- auth: TeoTwawki (aka Forgottenandlost)
-- desc: set arbitrary flags for testing
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, flags, target)
    if (flags == nil) then
        player:PrintToPlayer("You must enter a number for the flags (hex values work)");
        player:PrintToPlayer( "@setflag <flags> <target>" );
        return;
    end

    if (target == nil) then
        player:setFlag( flags );
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:setFlag( flags );
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@setflag <flags> <target>" );
        end
    end
end;


-- Test results       0x00000000
--------------------------------
-- ??               = 0x00000001
-- FLAG_INEVENT     = 0x00000002
-- INVIS            = 0x00000004
-- ??               = 0x00000008
-- ??               = 0x00000010
-- ??               = 0x00000020
-- FLAG_CHOCOBO     = 0x00000040
-- ??               = 0x00000080
-- DESPAWN          = 0x00000100
-- FLAG_WALLHACK    = 0x00000200
-- ??               = 0x00000400
-- FLAG_INVITE      = 0x00000800
-- FLAG_ANON        = 0x00001000
-- FLAG_UNKNOWN     = 0x00002000    Orange Name, auto-group or 'call for help' color, not sure which.
-- FLAG_AWAY        = 0x00004000
-- ??               = 0x00008000
-- FLAG_PLAYONLINE  = 0x00010000
-- FLAG_LINKSHELL   = 0x00020000
-- FLAG_DC          = 0x00040000
-- TARGETABLE       = 0x00080000
-- ??               = 0x00100000
-- ??               = 0x00200000    Self visible only - Trial Account
-- ??               = 0x00400000    Self visible only - Causes POL_ICON With tinted name when combined with 0x00200000 / 0x01000000 / 0x02000000
--                    0x00500000
-- GM               = 0x00800000    Self visible only - Mutually exclusive with 0x04000000
-- FLAG_RESTRICTED  = 0x01000000    Trial Account
-- ??               = 0x02000000    Causes POL_ICON With tinted name when combined with 0x00200000 / 0x00400000 / 0x01000000
-- GM               = 0x04000000    Mutually exclusive with 0x00800000
-- FLAG_GM_SENIOR   = 0x05000000
-- FLAG_GM_LEAD     = 0x06000000
-- FLAG_GM_PRODUCER = 0x07000000
-- ??               = 0x08000000
-- ??               = 0x10000000
-- ??               = 0x20000000    Invis?
-- ??               = 0x40000000
-- FLAG_BAZAAR      = 0x80000000
