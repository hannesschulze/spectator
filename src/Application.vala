/*
* Copyright (c) 2018 Marvin Ahlgrimm (https://github.com/treagod)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Marvin Ahlgrimm <marv.ahlgrimm@gmail.com>
*/

namespace Spectator {
    public class Application : Gtk.Application {
        // Avoid multiple instances
        public bool running = false;
        public Window window;

        construct {
            flags |= ApplicationFlags.HANDLES_OPEN;
            application_id = "com.github.treagod.spectator";
        }

        protected override void activate () {
            if (!running) {
                window = new Window (this);
                this.add_window (window);

                running = true;

                return;
            }
            window.show_app ();
        }

        public static int main (string[] args) {
            return new Application ().run (args);
        }
    }
}
