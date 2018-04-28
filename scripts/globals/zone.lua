------------------------------------
--
-- Contains global functions and variables
-- related to area specific things
--
------------------------------------
dsp = dsp or {};

dsp.zoneType =
{
    NONE           = 0,
    CITY           = 1,
    OUTDOORS       = 2,
    DUNGEON        = 3,
    BATTLEFIELD    = 4,
    DYNAMIS        = 5,
    INSTANCED      = 6,
};

dsp.continent =
{
    THE_MIDDLE_LANDS        = 1,
    THE_ARADJIAH_CONTINENT  = 2,
    THE_SHADOWREIGN_ERA     = 3,
    OTHER_AREAS             = 4,
};

dsp.region =
{
    RONFAURE         = 0,
    ZULKHEIM         = 1,
    NORVALLEN        = 2,
    GUSTABERG        = 3,
    DERFLAND         = 4,
    SARUTABARUTA     = 5,
    KOLSHUSHU        = 6,
    ARAGONEU         = 7,
    FAUREGANDI       = 8,
    VALDEAUNIA       = 9,
    QUFIMISLAND      = 10,
    LITELOR          = 11,
    KUZOTZ           = 12,
    VOLLBOW          = 13,
    ELSHIMOLOWLANDS  = 14,
    ELSHIMOUPLANDS   = 15,
    TULIA            = 16,
    MOVALPOLOS       = 17,
    TAVNAZIA         = 18,
    SANDORIA         = 19,
    BASTOK           = 20,
    WINDURST         = 21,
    JEUNO            = 22,
    DYNAMIS          = 23,
    TAVNAZIAN_MARQ   = 24,
    PROMYVION        = 25,
    LUMORIA          = 26,
    LIMBUS           = 27,
    WEST_AHT_URHGAN  = 28,
    MAMOOL_JA_SAVAGE = 29,
    HALVUNG          = 30,
    ARRAPAGO         = 31,
    ALZADAAL         = 32,
    RONFAURE_FRONT   = 33,
    NORVALLEN_FRONT  = 34,
    GUSTABERG_FRONT  = 35,
    DERFLAND_FRONT   = 36,
    SARUTA_FRONT     = 37,
    ARAGONEAU_FRONT  = 38,
    FAUREGANDI_FRONT = 39,
    VALDEAUNIA_FRONT = 40,
    ABYSSEA          = 41,
    THE_THRESHOLD    = 42,
    ABDHALJS         = 43,
    ADOULIN_ISLANDS  = 44,
    EAST_ULBUKA      = 45,
    UNKNOWN          = 255,
};

-----------------------------------
-- SetExplorerMoogles
----------------------------------

function SetExplorerMoogles(moogle)
    if (EXPLORER_MOOGLE == 1) then
        local npc = GetNPCByID(moogle);
        if (npc == nil) then
            printf("'SetExplorerMoogles' Error trying to load undefined npc (%d)", moogle);
        else
            npc:setStatus(0);
        end
    end
end;
