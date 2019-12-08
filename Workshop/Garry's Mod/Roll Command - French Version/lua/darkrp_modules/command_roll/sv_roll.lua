local function Roll(ply, args)
     local say = function()
          if GAMEMODE.Config.alltalk then
               for _,target in pairs(player.GetAll()) do
                    DarkRP.talkToPerson(target, team.GetColor(ply:Team()), ply:Nick().. ' a tourné les dés et a fait ' .. math.random(1, 100) .. '.')
               end
          else
               DarkRP.talkToRange(ply, ply:Nick().. ' a tourné les dés et a fait ' .. math.random(1, 100) .. '.', '', 250)
          end
     end

     return args, say
end

DarkRP.defineChatCommand('roll', Roll, 1.5)
DarkRP.declareChatCommand{
     command = 'roll',
     description = 'Vous permet d\'obtenir un nombre aléatoire entre 1 et 100.',
     delay = 1.5
}