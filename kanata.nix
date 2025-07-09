{ inputs, config, pkgs, ...}:
{

  services.kanata = {
    enable = true;
    keyboards.test1 = {
      devices = [
        "/dev/input/event0"
        "/dev/input/event1"
      ];
      config = ''
      (defsrc
        i    9     = voldwn 4  down . `
        rctl ,     o 2      w  rght ' \
      )

      (deflayer default
        _     _     _ _     _  _    _ _
        @rctl _     _ _     _  _    _ _
      )

      (deflayer press
        8    0     - volu   f3 up   / esc
        _    prtsc p 3      e  lft  ; [
      )

      (defalias
        rctl (tap-hold 0 10 rctl (layer-toggle press))
      )
      '';
      extraDefCfg = "process-unmapped-keys yes";
    };
  };

}
