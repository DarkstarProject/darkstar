-----------------------------------
-- Area: Bibiki_Bay
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BIBIKI_BAY] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        YOU_OBTAIN              = 6396, -- You obtain
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        POHKA_SHOP_DIALOG       = 7219, -- Hey buddy, need a rod? I've got loads of state-of-the-art, top-of-the-line, high quality rods right here waitin' fer ya! Whaddya say?
        MEP_NHAPOPOLUKO_DIALOG  = 7221, -- Welcome! Fishermen's Guild representative, at your service!?Prompt?
        WHOA_HOLD_ON_NOW        = 7237, -- Whoa, hold on now. Ain't look like you got 'nuff room in that spiffy bag o' yours to carrrry all these darn clams.
        YOU_GIT_YER_BAG_READY   = 7238, -- You git yer bag ready, pardner? Well alrighty then. Here'rrre yer clams.
        YOU_RETURN_THE          = 7245, -- You return the
        AREA_IS_LITTERED        = 7246, -- The area is littered with pieces of broken seashells.
        YOU_FIND_ITEM           = 7248, -- You find$ and toss it into your bucket
        THE_WEIGHT_IS_TOO_MUCH  = 7249, -- You find$ and toss it into your bucket... But the weight is too much for the bucket and its bottom breaks! All your shellfish are washed back into the sea...
        YOU_CANNOT_COLLECT      = 7250, -- You cannot collect any clams with a broken bucket!
        IT_LOOKS_LIKE_SOMEONE   = 7251, -- It looks like someone has been digging here.
        YOUR_CLAMMING_CAPACITY  = 7259, -- Your clamming capacity has increased toponzes! Now you may be able to dig up a...
        SOMETHING_JUMPS_INTO    = 7262, -- Something jumps into your bucket and breaks through the bottom! All your shellfish are washed back into the sea...
        FISHING_MESSAGE_OFFSET  = 7263, -- You can't fish here.
        DIG_THROW_AWAY          = 7276, -- You dig up$, but your inventory is full. You regretfully throw the # away.
        FIND_NOTHING            = 7278, -- You dig and you dig, but find nothing.
        NOTHING_OUT_OF_ORDINARY = 7436, -- There is nothing out of the ordinary here.
        NO_BILLET               = 7480, -- You were refused passage for failing to present
        HAVE_BILLET             = 7485, -- You cannot buy morrre than one . Use the one you have now to ride the next ship.
        LEFT_BILLET             = 7490, -- You use your
        END_BILLET              = 7491, -- You use up your
        NEWS_BILLET             = 8659, -- added to your
    },
    mob =
    {
        DALHAM = 16793858,
        SHEN   = 16793859,
    },
    npc =
    {
    },
}

return zones[dsp.zone.BIBIKI_BAY]