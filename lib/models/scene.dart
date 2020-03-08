import 'event.dart';

class Scene {
  Scene({ this.id, this.events });
  final String id;
  final List<dynamic> events;

  static Scene fromJson(Map parsedJson) {
    List<dynamic> eventsAttrs = parsedJson['events'];
    List<dynamic> events = eventsAttrs.map((eventAttrs) {
      switch (eventAttrs['type']) {
        case 'Dialog': {
          return new DialogEvent(
            backgroundId: eventAttrs['backgroundId'],
            backgroundColor: eventAttrs['backgroundColor'],
            characterPositions: eventAttrs['characterPositions'],
            conversations: eventAttrs['conversations']
          );
        }
        break;
        case 'Monolog': {
          return new MonologEvent(
            backgroundId: eventAttrs['backgroundId'],
            backgroundColor: eventAttrs['backgroundColor'],
            messages: eventAttrs['messages']
          );
        }
        break;
        case 'GetItem': {
          return new GetItemEvent(
            visible: eventAttrs['visible'],
            purchased: eventAttrs['purchased'],
            itemId: eventAttrs['itemId'],
          );
        }
        break;
        case 'IncreaseHealth': {
          return new IncreaseHealthEvent(
            visible: eventAttrs['visible'],
            amount: eventAttrs['amount'],
          );
        }
        break;
        case 'IncreaseCurrency': {
          return new IncreaseCurrencyEvent(
            visible: eventAttrs['visible'],
            currencyId: eventAttrs['currencyId'],
            amount: eventAttrs['amount'],
          );
        }
        break;
        case 'DecreaseHealth': {
          return new DecreaseHealthEvent(
            visible: eventAttrs['visible'],
            amount: eventAttrs['amount'],
          );
        }
        break;
        case 'DecreaseCurrency': {
          return new DecreaseCurrencyEvent(
            visible: eventAttrs['visible'],
            currencyId: eventAttrs['currencyId'],
            amount: eventAttrs['amount'],
          );
        }
        break;
        case 'SingleSelect': {
          return new SingleSelectEvent(
            choices: eventAttrs['choices'],
          );
        }
        break;
        case 'Navigate': {
          return new NavigateEvent(
            sceneId: eventAttrs['sceneId'],
            eventIndex: eventAttrs['eventIndex'],
          );
        }
        break;
        default: {
          return new NullEvent();
        }
      }
    }).toList();

    return new Scene(id: parsedJson['id'], events: events);
  }
}