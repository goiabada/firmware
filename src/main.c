#include <chip.h>

inline void setup();
inline void loop();

int main() {
  setup();

  while (1) {
    loop();
  }

  return 0;
}


inline void setup() {}

inline void loop() {}
