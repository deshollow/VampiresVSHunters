//
//  RulesData.swift
//  VampiresVSHunters
//
//  Created by deshollow on 13.01.2024.
//

final class RulesDataStore {
    
    static let shared = RulesDataStore()
    let headers = [
    "С чего начать?",
    "И что дальше?",
    "А другой игрок не увидит мою роль?",
    "Как играть?",
    "Я догадываюсь, кто Охотник. Что делать?",
    "Я Охотник и догадался, какую локацию обсуждают остальные. Что делать?",
    "А зачем таймер?",
    "Как играть с несколькими Охотниками?"
    ]
    
    let texts = [
    "Выберите условия игры: набор слов, время игры, количество Охотников",
    "В игре есть два вида ролей: Вампиры и Охотники. Чтобы какждый узнал свою роль, передайте телефон по очереди каждому из игроков",
    "Не волнуйтесь, не увидит. Когда вы нажимаете на карточку, она перевернется. На обратной стороне тебе либо сообщат локацию и вы в этом случае Вампир, либо обрадуют новостью, что вы Охотник. После, нажмите на карточку еще раз она скроется, и вы увидите обложку следующей карточки. Тогда передайте телефон другому игроку, чтобы он ее перевернул и узнал свою роль",
    "Когда все узнали свои роли, начинайте игру. Задавайте друг другу вопросы о месте, Например: Какого цвето это место, Как часто ты там бываешь, В это место хочется возвращаться? Задача вампиров вычислить Охотника, человека не понимающего о каком месте идет речь. Задача Охотника делать вид, что он в курсе происходящего и попытаться догадаться, какую локацию обсуждают остальные игроки",
    "Скажи Я знаю кто Охотник. Тогда на счет три все игроки должны указать на того человека, кто по их мнению Охотник. Если все выбрали одного и того же игрока, то он должен раскрыть свою роль. Если он оказывается Вампиром - Охотник выигрывает. Если же этот человек действительно Охотник - выигрывают вампиры. Если игроки указали на разных людей - игра продолжается",
    "Просто скажи Я знаю о каком месте вы говорите, и назовите его. Если ты угадаешь - выиграешь. Ошибешься - победят Вампиры",
    "Если Вампиры успели вычислить Охотника до того, как прозвенел таймер, то они выигрывают. Если Охотник смог продержаться все это время, то выигрывает он",
    "Количество Охотников всегда должно быть меньше количества Вампиров. Если Охотников несколько, то каждый из них играет сам за себя. Чтобы победить Вампирам нужно вычислить всех Охотников. Если же они вычисляют не всех, то побеждают те Охотники, которых они не раскрыли. В случае когда все игроки указывают на человека, которого считают Охотником, если он оказывается Вампиром - Охотники выигрывают. Если же Вампиры угадывают - раскрытый Охотник выходит из игры, а игра продолжается, ведь нужно вычислить всех Охотников. В случае когда один из Охотников называет локацию, если он угадывает, игра заканчиваетчя, а этот Охотник побеждает. Если же он называет неправильное место - игра продолжается без его участия."
    ]
    
    private init() {}
}
