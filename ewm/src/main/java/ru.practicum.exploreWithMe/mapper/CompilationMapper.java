package ru.practicum.exploreWithMe.mapper;

import org.mapstruct.Mapper;
import ru.practicum.exploreWithMe.dto.CompilationDtoOutput;
import ru.practicum.exploreWithMe.model.Compilation;

@Mapper
public interface CompilationMapper {
    CompilationDtoOutput compilationDtoOutputFromCompilation(Compilation compilation);
}
