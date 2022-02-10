package com.gocom.Util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmojiUtil {
	public static List<String> loadEmoji() {
		List<String> list = new ArrayList<String>();
		list.add("angry");
		list.add("clap");
		list.add("curious");
		list.add("hate");
		list.add("love");
		list.add("scare");
		list.add("shock");
		
		return list;
	}
	public static Map<String,Integer> setPosition(){
		Map<String, Integer> map = new HashMap<String, Integer>();
		int x = (int)( Math.random() * 100 );
		map.put("x",x);
		int y = (int)( Math.random() * 100 );
		map.put("y",y);
		return map;
	}
}
