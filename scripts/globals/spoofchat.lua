-----------------------------------
--
-- Defines chat types for use with
-- SpoofChatPlayer and SpoofChatServer
--
-----------------------------------

    MESSAGE_SAY         = 0x00
    MESSAGE_SHOUT       = 0x01
    MESSAGE_UNKNOWN     = 0x02 -- Does not work?
    MESSAGE_TELL        = 0x03
    MESSAGE_PARTY       = 0x04
    MESSAGE_LINKSHELL   = 0x05
    MESSAGE_SYSTEM_1    = 0x06
    MESSAGE_SYSTEM_2    = 0x07
    MESSAGE_EMOTION     = 0x08
    -- MESSAGE_NONE        = 0x09 -- Does not work?
    -- MESSAGE_NONE        = 0x0A -- Does not work?
    -- MESSAGE_NONE        = 0x0B -- Does not work?
    MESSAGE_GM_PROMPT   = 0x0C -- Menu prompt from GM
    MESSAGE_SYS_SAY     = 0x0D -- Same as MESSAGE_SAY but has no speaker object displayed
    MESSAGE_SYS_SHOUT   = 0x0E -- Same as MESSAGE_SHOUT but has no speaker object displayed
    MESSAGE_SYS_PARTY   = 0x0F -- Same as MESSAGE_PARTY but has no speaker object displayed
    MESSAGE_SYS_LS      = 0x10 -- Same as MESSAGE_LINKSHELL but has no speaker object displayed
    -- MESSAGE_UNKNOWN     = 0x11 -- Echo
    -- MESSAGE_UNKNOWN     = 0x12 -- Echo
    -- MESSAGE_UNKNOWN     = 0x13 -- Echo
    MESSAGE_ECHO        = 0x14 -- Echo
    -- MESSAGE_UNKNOWN     = 0x15 -- Echo
    -- MESSAGE_UNKNOWN     = 0x16 -- Echo
    -- MESSAGE_UNKNOWN     = 0x17 -- Echo
    -- MESSAGE_UNKNOWN     = 0x18 -- Say
    -- MESSAGE_UNKNOWN     = 0x19 -- Say
    MESSAGE_YELL        = 0x1A
    MESSAGE_LINKSHELL2  = 0x1B -- Second LS color...Default is Green
    MESSAGE_SYS_LS2     = 0x1C -- Same as MESSAGE_LINKSHELL_2 but has but has no speaker object displayed
    -- MESSAGE_LINKSHELL3  = 0x1E -- 3rd LS?
    -- MESSAGE_SYS_LS3     = 0x1F -- Echo? / Same as MESSAGE_LINKSHELL_3 but has but has no speaker object displayed?
    -- MESSAGE_UNKNOWN     = 0x20 -- Echo
    MESSAGE_UNITY       = 0x21
