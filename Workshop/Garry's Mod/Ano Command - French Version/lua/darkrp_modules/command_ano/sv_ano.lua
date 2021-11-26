local playerMeta = FindMetaTable('Player')

local function playerMeta:PlayerIsStaff()
    local Groups = {'superadmin', 'admin', 'moderator', 'moderateur'}

    for k,v in pairs(Groups) do
        if self:IsUserGroup(v) then
            return true
        end
    end

    return false
end

local function Anonyme(ply, args)
    if args == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase('invalid_x', 'argument', ''))
        return
    end

    local say = function(message)
        if message == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase('invalid_x', 'argument', ''))
            return
        end

        if ply:PlayerIsStaff() then
            for k,v in pairs(player.GetAll()) do
                DarkRP.talkToPerson(v, Color(255, 0, 0, 255), '[Anonyme] ' .. ply:Nick(), Color(255, 255, 255, 255), message, ply)
            end
        else
            for k,v in pairs(player.GetAll()) do
                DarkRP.talkToPerson(v, Color(255, 0, 0, 255), '[Anonyme] ', Color(255, 255, 255, 255), message, ply)
            end
        end
    end

    return args, say
end

DarkRP.defineChatCommand('ano', Anonyme, 1.5)
DarkRP.declareChatCommand {
    command = 'ano',
    description = 'Vous permet de parler à une personne en inconnue.',
    delay = 1.5
}
