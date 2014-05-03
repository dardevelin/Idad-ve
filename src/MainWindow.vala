/*
 * MainWindow.vala
 * This file is part of Idad-ve
 * Copyright (C) 2014  Darcy Bras da Silva
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/
 */

/**
 * @author dardevelin
 */

public class MainWindow : Gtk.ApplicationWindow
{
	private int last_msg_id = -1;
	private static const string[] messages = {
		"Hi, free user. I'm dad.",
		"I don't know. Can you do the thing?",
		"SPORTS!"
	};

	internal MainWindow(Gtk.Application app) {
		Object ( application: app, title: "Idad - vala edition");

		this.window_position = Gtk.WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		this.set_default_size(300, 200);

		var vbox = new Gtk.Box(Gtk.Orientation.VERTICAL,1);

		var text_message = new Gtk.Label("iDad - vala edition");
		text_message.set_line_wrap(true);

		var next_msg_btn = new Gtk.Button.with_label("Next Message");

		next_msg_btn.clicked.connect( () => {
				++this.last_msg_id;
				if ( last_msg_id > -1 && last_msg_id < 3 ) {
					text_message.set_text(messages[last_msg_id]);
				} else {
					last_msg_id =  0;
					text_message.set_text(messages[last_msg_id]);
				}
			});

		this.add(vbox);
		vbox.pack_start(text_message, true, true, 0);
		vbox.pack_end(next_msg_btn,false, false, 0);
	}

}

public class iDadApp : Gtk.Application {

	protected override void activate() {
		//create the window of this application
		new MainWindow (this).show_all();
	}

	//main creates and runs the application
	public static int main(string[] args) {
		return new iDadApp().run(args);
	}
}