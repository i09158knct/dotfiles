S.log('[SLATE] ----------- Start Loading Config -----------');


function shellSync(command) {
  return S.op('shell', { command: command, wait: true });
}

function focusTo(direction) {
  return S.op('focus', { direction: direction });
}

function pushTo(direction) {
  return S.op('push', { direction: direction });
}

function nudge(x, y) {
  return S.op('nudge', { x: x, y: y });
}

function resize(width, height) {
  return S.op('resize', { width: width, height: height });
}

function stretch(opts) {
  return function(window) {
    var prevPos, pos, x, y, width, height;
    prevPos = window.topLeft();

    x = '-' + (opts.left || '0');
    y = '-' + (opts.top || '0');
    nudge(x, y).run();

    pos = window.topLeft();
    width = '+' + (opts.right || (prevPos.x - pos.x));
    height = '+' + (opts.bottom || (prevPos.y - pos.y));
    resize(width, height).run();
  };
}

function shrink(opts) {
  return function(window) {
    var prevSize, size, x, y, width, height;
    prevSize = window.size();

    width = '-' + (opts.right || opts.left || '0');
    height = '-' + (opts.bottom || opts.top || '0');
    resize(width, height).run();

    size = window.size();
    x = '+' + (opts.left ? (prevSize.width - size.width) : '0');
    y = '+' + (opts.top ? (prevSize.height - size.height) : '0');
    nudge(x, y).run();
  };
}



S.cfga({
  defaultToCurrentScreen: true,
  secondsBetweenRepeat  : 0.03,
  checkDefaultsOnLoad   : true,
  focusCheckWidthMax    : 3000,

  windowHintsIgnoreHiddenWindows: false,
});



S.bindAll({
  'r:ctrl,cmd': S.op('relaunch'),
  // ';:ctrl,cmd': S.op('hint', { characters: 'sdfjkl;1234567890' }),
  // 'z:ctrl,cmd': S.op('undo'),
  // 'esc:ctrl': S.op('grid'),
  // 'tab:cmd': S.op('switch'),
  // 'tab:shift,cmd': S.op('switch'),

  'q:ctrl,cmd': shellSync('/usr/bin/open -a iterm'),
  'w:ctrl,cmd': shellSync('~/.slate.d/slate-open-chrome.sh'),
  'e:ctrl,cmd': shellSync('~/.slate.d/slate-open-sublime.sh'),

  // 'k:ctrl,cmd': focusTo('up'),
  // 'j:ctrl,cmd': focusTo('down'),
  // 'h:ctrl,cmd': focusTo('left'),
  // 'l:ctrl,cmd': focusTo('right'),

  'up:ctrl,cmd'   : pushTo('up'),
  'down:ctrl,cmd' : pushTo('down'),
  'left:ctrl,cmd' : pushTo('left'),
  'right:ctrl,cmd': pushTo('right'),

  'up:shift,ctrl,cmd'   : nudge('+0%', '-3%'),
  'down:shift,ctrl,cmd' : nudge('+0%', '+3%'),
  'left:shift,ctrl,cmd' : nudge('-3%', '+0%'),
  'right:shift,ctrl,cmd': nudge('+3%', '+0%'),

  'k:ctrl,cmd': [stretch({ top: '3%' }), true],
  'j:ctrl,cmd': [stretch({ bottom: '3%' }), true],
  'h:ctrl,cmd': [stretch({ left: '3%' }), true],
  'l:ctrl,cmd': [stretch({ right: '3%' }), true],

  'k:shift,ctrl,cmd': [shrink({ bottom: '3%' }), true],
  'j:shift,ctrl,cmd': [shrink({ top: '3%' }), true],
  'h:shift,ctrl,cmd': [shrink({ right: '3%' }), true],
  'l:shift,ctrl,cmd': [shrink({ left: '3%' }), true],
});


S.log('[SLATE] ----------- Finished Loading Config -----------');
