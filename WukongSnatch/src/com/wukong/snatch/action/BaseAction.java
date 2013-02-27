package com.wukong.snatch.action;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public interface BaseAction {
	ExecutorService executorService=Executors.newFixedThreadPool(8);
}
