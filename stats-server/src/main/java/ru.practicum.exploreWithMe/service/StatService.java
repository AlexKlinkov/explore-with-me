package ru.practicum.exploreWithMe.service;

import ru.practicum.exploreWithMe.dto.EndpointHitDTOInput;
import ru.practicum.exploreWithMe.dto.StatOutput;

import java.util.List;

public interface StatService {
    void saveStat (EndpointHitDTOInput endpointHitDTOInput);
    List<StatOutput> getStats (String start, String end, List<String> uris, Boolean unique);
}