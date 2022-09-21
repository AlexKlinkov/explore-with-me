package ru.practicum.exploreWithMe.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.practicum.exploreWithMe.auxiliaryObjects.Location;
import ru.practicum.exploreWithMe.auxiliaryObjects.StatusOfEvent;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event {
    private Long id; // id of event
    private String annotation; // annotation of event, which describes it (necessary for looking for demanded event)
    private String title; // short description of event
    private String description; // full and precise description of event
    private Long categoryId; // this reference on table with category information
    private Long initiatorId; // this reference on table with users information
    private Long confirmedRequests; // amount of persons who confirmed entrance
    private Long participantLimit; // max amount of persons who can take part in this event
    private Location location; // coordinates where event will be passing
    private LocalDateTime createdOn; // date when initiator declared about event
    private LocalDateTime publishedOn; // date when moderator checked this event with positive status
    private LocalDateTime eventDate; // time of happening of event
    private StatusOfEvent state; // status of event {PUBLISHED, WAITING....}
    private Boolean paid; // indicator which indicates event is free or for the money
    private Long views; // amount views of persons who was interested in an event
    private Boolean requestModeration; // indicator which indicates - is there necessary to fix something
    // in event by moderator
}
