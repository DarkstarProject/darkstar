-- mind your globals
local text = {
    -- Variable TextID   Description text

    -- General Texts
    ITEM_CANNOT_BE_OBTAINED = 6379, -- You cannot obtain the item <item> come back again after sorting your inventory.
              ITEM_OBTAINED = 6384, -- Obtained: <item>.
           KEYITEM_OBTAINED = 6387, -- Obtained key item: <keyitem>.

    -- Conquest
    CONQUEST_BASE = 7140, -- Tallying conquest results...
         CONQUEST = 7445, -- You've earned conquest points!


    -- Harvesting
    HARVESTING_IS_POSSIBLE_HERE = 7429, -- Harvesting is possible here if you have

    -- NPC Dialog
    IPUPU_DIALOG = 7384, -- I decided to take a little strolly-wolly, but before I realized it, I found myself way out here! Now I am sorta stuck... Woe is me!

    -- Other Dialog
    NOTHING_HAPPENS = 7299, -- Nothing happens...

    -- Signs
     SIGN_1 = 7369, -- Northeast: Central Tower, Horutoto Ruins Northwest: Giddeus South: Port Windurst
     SIGN_3 = 7370, -- East: East Sarutabaruta West: Giddeus
     SIGN_5 = 7371, -- Northeast: Central Tower, Horutoto Ruins East: East Sarutabaruta West: Giddeus
     SIGN_7 = 7372, -- South: Windurst East: East Sarutabaruta
     SIGN_9 = 7373, -- West: Giddeus North: East Sarutabaruta South: Windurst
    SIGN_11 = 7374, -- North: East Sarutabaruta Southeast: Windurst
    SIGN_13 = 7375, -- East: Port Windurst West: West Tower, Horutoto Ruins
    SIGN_15 = 7376, -- East: East Sarutabaruta West: Giddeus Southeast: Windurst
    SIGN_17 = 7377, -- Northwest: Northwest Tower, Horutoto RuinsEast: Outpost Southwest: Giddeus

    -- chocobo digging
    DIG_THROW_AWAY = 7058, -- You dig up ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, but your inventory is full.
    FIND_NOTHING = 7060, -- You dig and you dig, but find nothing.

    -- Quests
                A_FROST_DEPOSIT = 7391, -- A frost deposit at the base of the tree twinkles in the starlight.
    IT_LOOKS_LIKE_IT_WOULD_MELT = 7393, -- It looks like it would melt if you touched it with your bare hands...
            NOTHING_TO_SEE_HERE = 7394, -- There is nothing out of the ordinary here.≺Prompt≻

};

return text;
