import board

from kb import KMKKeyboard

from kmk.keys import KC
from kmk.modules.holdtap import HoldTap
from kmk.modules.layers import Layers
from kmk.modules.mouse_keys import MouseKeys
from kmk.modules.split import Split
from kmk.modules.capsword import CapsWord
from kmk.modules.tapdance import TapDance

keyboard = KMKKeyboard()

split = Split(
    data_pin=board.D1,
    use_pio=True,
    uart_flip=True,
)

layers = Layers()
holdtap = HoldTap()
mouse_key = MouseKeys()
caps_word = CapsWord()
tap_dance = TapDance()
tap_dance.tap_time = 200

keyboard.modules = [layers, split, holdtap, mouse_key, caps_word, tap_dance]

# Cleaner key names
_______ = KC.TRNS
XXXXXXX = KC.NO


# Hold Taps - Home Row Mods
A_GUI = KC.HT(KC.A, KC.LGUI)
R_ALT = KC.HT(KC.R, KC.LALT)
S_CTRL = KC.HT(KC.S, KC.LCTL)
T_SFT = KC.HT(KC.T, KC.LSFT)
G_HYPR = KC.HT(KC.G, KC.HYPR)
M_HYPR = KC.HT(KC.M, KC.HYPR)
N_SFT = KC.HT(KC.N, KC.LSFT)
E_CTRL = KC.HT(KC.E, KC.LCTL)
I_ALT = KC.HT(KC.I, KC.LALT)
O_GUI = KC.HT(KC.O, KC.LGUI)

# Layers
BSPC_LT1 = KC.LT(1, KC.BSPC)
SPC_LT2 = KC.LT(2, KC.SPC)
TAB_LT3 = KC.LT(3, KC.TAB)
ENT_LT4 = KC.LT(4, KC.ENT)

# Mod Taps
CTRL_PGUP = KC.LCTL(KC.PGUP)
CTRL_PGDN = KC.LCTL(KC.PGDN)
UNDO = KC.LCTL(KC.Z)
COPY = KC.LCTL(KC.C)
PASTE = KC.LCTL(KC.V)
CUT = KC.LCTL(KC.X)
REDO = KC.LCTL(KC.Y)
LGUI_ESC = KC.LGUI(KC.ESC)

# One Shot Mods
OS_HYPR = KC.OS(KC.HYPR)
OS_RALT = KC.OS(KC.RALT)
OS_LCTL = KC.OS(KC.LCTL)
OS_LSFT = KC.OS(KC.LSFT)
OS_LALT = KC.OS(KC.LALT)

# Tap Dance
CAPS_TD = KC.TD(
    # Tap once for caps word
    KC.CW,
    # Tap twice for caps lock
    KC.CAPS,
)

# fmt: off
# flake8: noqa
keyboard.keymap = [
    [  # 0 COLEMAK DHM
       KC.Q,   KC.W,   KC.F,    KC.P,    KC.B,    KC.J,    KC.L,    KC.U,    KC.Y,    KC.SCLN,
       A_GUI,  R_ALT,  S_CTRL,  T_SFT,   G_HYPR,  M_HYPR,  N_SFT,   E_CTRL,  I_ALT,   O_GUI,
       KC.Z,   KC.X,   KC.C,    KC.D,    KC.V,    KC.K,    KC.H,    KC.COMM, KC.DOT,  KC.SLSH,
                            BSPC_LT1, TAB_LT3,    ENT_LT4, SPC_LT2,
    ],
    [  # 1 NAVIGATION
    XXXXXXX,   XXXXXXX, CTRL_PGUP,   CTRL_PGDN, XXXXXXX, KC.PGUP, KC.HOME, KC.UP, KC.END,  KC.ESC,
    KC.LGUI, KC.LALT, KC.LCTL, KC.LSFT, OS_HYPR, KC.PGDN,  KC.LEFT, KC.DOWN,  KC.RIGHT, KC.DEL,
    XXXXXXX,   OS_RALT, XXXXXXX,   XXXXXXX, XXXXXXX, UNDO,   COPY, PASTE,   CUT,  REDO,
                                   _______, XXXXXXX, KC.ENT, CAPS_TD,
    ],
    [  # 2 SYMBOLS
    KC.GRV,   KC.SLSH, KC.ASTR, KC.AMPR, KC.MINS, XXXXXXX, KC.LBRC, KC.RBRC, XXXXXXX,  XXXXXXX,
    KC.QUOTE, KC.CIRC, KC.PERC, KC.DLR, KC.EQL, OS_HYPR,  KC.LSFT, KC.LCTL,  KC.LALT, KC.LGUI,
    KC.TILD,   KC.HASH, KC.AT,   KC.EXLM, KC.BSLS, XXXXXXX,   KC.LCBR, KC.RCBR,   XXXXXXX,  XXXXXXX,
                                   KC.LPRN, KC.RPRN, XXXXXXX, _______,
    ],
    [  # 3 FUNCTION KEYS
    XXXXXXX, KC.F9, KC.F8, KC.F7, KC.F12, KC.PLUS, KC.N7, KC.N8, KC.N9, KC.ASTR,
    KC.ESC, KC.F6, KC.F5, KC.F4, KC.F11, KC.MINS, KC.N4, KC.N5, KC.N6, KC.SLSH,
    OS_LCTL, KC.F3, KC.F2, KC.F1, KC.F10, KC.N0, KC.N1, KC.N2, KC.N3, OS_LALT,
                               XXXXXXX, _______, KC.ENT, KC.DOT,
    ],
    [  # 4 MOUSE AND SYSTEM
    KC.RESET, KC.MB_LMB, KC.MS_UP, KC.MB_RMB, KC.MB_MMB, OS_LCTL, KC.MPRV, KC.MPLY, KC.MNXT, KC.RESET,
    XXXXXXX, KC.MS_LT, KC.MS_DN, KC.MS_RT, KC.MW_UP, OS_LSFT, KC.VOLD, KC.MUTE, KC.VOLU, XXXXXXX,
    XXXXXXX, XXXXXXX, KC.MW_LT, KC.MW_RT, KC.MW_DN, OS_LALT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
                               KC.PSCR, LGUI_ESC, _______, XXXXXXX,
    ],
    [  # 5 SIMPLE COLEMAK DHM
       KC.Q,   KC.W,   KC.F,    KC.P,    KC.B,    KC.J,    KC.L,    KC.U,    KC.Y,    KC.SCLN,
       KC.A,  KC.R,  KC.S,  KC.T,   KC.G,  KC.M,  KC.N,   KC.E,  KC.I,   KC.O,
       KC.Z,   KC.X,   KC.C,    KC.D,    KC.V,    KC.K,    KC.H,    KC.COMM, KC.DOT,  KC.SLSH,
                            KC.BSPC, KC.TAB,    KC.ENT, KC.SPC,
    ],
    [  # BLANK
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
                               _______, _______, _______, _______,
    ],
]

if __name__ == "__main__":
    keyboard.go()
