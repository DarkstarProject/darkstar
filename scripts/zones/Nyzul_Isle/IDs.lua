NyzulIsle = {

    text = {
        -- General Texts
        ITEM_CANNOT_BE_OBTAINED = 6379; -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED = 6384; -- Obtained: <item>
        GIL_OBTAINED = 6385; -- Obtained <number> gil
        KEYITEM_OBTAINED = 6387; -- Obtained key item: <keyitem>

        -- Assault Texts
        TIME_TO_COMPLETE = 7299, -- to complete this mission
        MISSION_FAILED = 7300, -- The mission has failed. Leaving area
        TIME_REMAINING_MINUTES = 7304, -- minute/minutes
        TIME_REMAINING_SECONDS = 7305, -- second/seconds
        PARTY_FALLEN = 7307, -- party members have fallen in battle. Mission failure in

        -- Amnaf/Flayer Amnaf battle texts
        FORMATION_GELINCIK = 7499, -- Formation Gelincik! Eliminate the intruders!≺Prompt≻
        SURRENDER          = 7500, -- You would be wise to surrender. A fate worse than death awaits those who anger an Immortal...≺Prompt≻
        I_WILL_SINK_YOUR_CORPSES = 7501; -- I will sink your corpses to the bottom of the Cyan Deep!≺Prompt≻
        AWAKEN          = 7502, -- Awaken, powers of the Lamiae!≺Prompt≻
        MANIFEST        = 7503, -- Manifest, powers of the Merrow!≺Prompt≻
        CURSED_ESSENCES = 7504, -- Cursed essences of creatures devoured...Infuse my blood with your beastly might!≺Prompt≻
        UGH             = 7505, -- Ugh...I should not be surprised...
        CANNOT_WIN      = 7506, -- Hehe...hehehe...You are...too strong for me...I cannot win...in this way...≺Prompt≻
        CANNOT_LET_YOU_PASS = 7507, -- <Wheeze>...I cannot...let you...pass...≺Prompt≻
        WHEEZE              = 7508, -- <Wheeze>...≺Prompt≻
        WHEEZE_PHSHOOO      = 7509, -- <Wheeze>...<phshooo>!≺Prompt≻
        PHSHOOO             = 7510, -- <Phshooo>...≺Prompt≻
        NOT_POSSIBLE        = 7511, -- <Phshooo>...Not...possible...≺Prompt≻

        -- Naja battle texts
        ALRRRIGHTY = 7512, -- Alrrrighty!
        CHA_CHING  = 7513, -- Cha-ching! Thirty gold coins!≺Prompt≻
        TWELVE_GOLD_COINS        = 7514, -- Hehe! This one'll cost ya twelve gold coins a punch! The grrreat gouts of blood are frrree of charge!≺Prompt≻
        NINETY_NINE_SILVER_COINS = 7515; -- Ninety-nine silver coins a pop! A bargain, I tell ya!≺Prompt≻
        THIS_BATTLE = 7516, -- This battle is rrreally draggin' on... Just think of the dry cleanin' bill!≺Prompt≻
        OW          = 7517, -- Ow...! Ya do rrrealize the medical costs are comin' outta your salary, don't ya?≺Prompt≻
        ABQUHBAH    = 7518, -- A-Abquhbah! D-don't even think about...rrraisin' the wages...Management...is a mean world...ugh...≺Prompt≻
        OH_ARE_WE_DONE  = 7519, -- Oh, are we done? I wasn't done rrrackin' up the fees...You've got more in ya, rrright?≺Prompt≻
        NOW_WERE_TALKIN = 7520, -- Now we're talkin'! I can hear the clinkin' of coin mountains collapsin' over my desk...Let's get this over with!≺Prompt≻

        -- Raubahn battle texts (ToAU 44)
        PRAY   = 7521, -- Pray to whatever gods you serve.≺Prompt≻
        BEHOLD = 7522, -- Behold the power of my eldritch gaze!≺Prompt≻
        CARVE  = 7523, -- I will carve the soul fresh from your bones.≺Prompt≻
        RESIST_MELEE = 7524, -- My flesh remembers the wounds of ten thousand blades. Come, cut me again...≺Prompt≻
        RESIST_MAGIC = 7525, -- My skin remembers the fires of ten thousand spells. Come, burn me again...≺Prompt≻
        RESIST_RANGE = 7526, -- My belly remembers the punctures of ten thousand arrows. Come, shoot me again...≺Prompt≻
        NOW_UNDERSTAND = 7527, -- Hehehe...Do you now understand what it is to fight a true Immortal? Realize your futility and embrace despair...≺Prompt≻
        MIRACLE        = 7528, -- Ugh... Has your god granted you the miracle you seek...?≺Prompt≻

        -- Alexander battle texts (ToAU 44)
        SHALL_BE_JUDGED     = 7530, -- I am...Alexander...The meek...shall be rewarded...The defiant...shall be judged...≺Prompt≻
        OFFER_THY_WORSHIP   = 7531, -- Offer thy worship...I shall burn away...thy transgressions...≺Prompt≻
        OPEN_THINE_EYES     = 7532, -- Open thine eyes...My radiance...shall guide thee...≺Prompt≻
        CEASE_THY_STRUGGLES = 7533, -- Cease thy struggles...I am immutable...indestructible...impervious...immortal...≺Prompt≻
        RELEASE_THY_SELF    = 7534, -- Release thy self...My divine flames...shall melt thy flesh...sear thy bones...unshackle thy soul...≺Prompt≻
        BASK_IN_MY_GLORY    = 7535, -- Bask in my glory...Mine existence...stretches into infinity...≺Prompt≻
        REPENT_THY_IRREVERENCE = 7536, -- Repent thy irreverence...The gate to salvation...lies before thee...Revelation...is within thy reach...≺Prompt≻
        ACCEPT_THY_DESTRUCTION = 7537, -- Accept thy destruction...Wish for eternity...yearn for immortality...Sense thy transience...know thy insignificance...≺Prompt≻
        OMEGA_SPAM             = 7538, -- ΩΩΩΩΩΩΩ≺Prompt≻
        SHALL_KNOW_OBLIVION    = 7539 -- I am...Alexander...The fearful...shall be embraced...The bold...shall know oblivion...≺Prompt≻
    },

    mobs = {
        -- Path of Darkness
        [58] = {
            AMNAF_BLU = 17093132,
            AMNAF_PSYCHEFLAYER = 17093133,
            IMPERIAL_GEAR1 = 17093134,
            IMPERIAL_GEAR2 = 17093135,
            IMPERIAL_GEAR3 = 17093136,
            IMPERIAL_GEAR4 = 17093137,
            NAJA = 17093142,
        },
        [59] = {
            RAZFAHD = 17093143,
            ALEXANDER = 17093144,
            RAUBAHN = 17093145,
        }
    },

    npcs = {
        _257 = 17093355,
        _259 = 17093357,
        QM1 = 17093468,
        BLANK1 = 17093469,
        BLANK2 = 17093470,
        BLANK3 = 17093471,
        NASHMEIRA1 = 17093472,
        NASHMEIRA2 = 17093473,
        RAZFAHD = 17093474,
        CSNPC1 = 17093475,
        GHATSAD = 17093476,
        ALEXANDER = 17093477,
        CSNPC2 = 17093478,
        WEATHER = 17093419,
    }

}
