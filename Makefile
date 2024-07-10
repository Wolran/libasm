###############
## Variables ##
###############

NAME		=	libasm.a
NAME_TEST	=	test_lib
LIBDIR		=
INCLDIR		=	$(addsuffix /inc,$(LIBDIR) .)
BUILDIR		=	build
DEPDIR		=	$(BUILDIR)/.deps

SRCS_DIR	=	$(sort $(dir $(wildcard src/*/)))

SRC_ASM		=	$(addprefix src/,			\
					$(addprefix mandatory/,	\
						ft_read.s			\
						ft_strcmp.s			\
						ft_strcpy.s			\
						ft_strdup.s			\
						ft_strlen.s			\
						ft_write.s			\
					)						\
					$(addprefix bonus/,		\
						ft_atoi_base.s		\
						ft_list_push_front.s\
						ft_list_size.s		\
						ft_list_sort.s		\
					)						\
				)

OBJ			=	$(SRC_ASM:%.s=$(BUILDIR)/%.o)
DEP			=	$(SRC_ASM:%.s=$(DEPDIR)/%.d)

ASM_COMP	=	nasm
ASM_FLAGS	=	-felf64 -wall -g -O0
CXXFLAGS	=	-gdbg -O0 $(addprefix -I, $(INCLDIR))
DEPFLAGS	=	-MT $@ -MP -MF $(DEPDIR)/$*.d
RM			=	/bin/rm -rf

# FG COLORS
DEFAULT		=	\033[0m
GREEN		=	\033[1;32m
YELLOW		=	\033[1;33m
BLUE		=	\033[1;34m
CYAN 		=	\033[1;36m

# TERMCAPS
UP			=	\033[1A
DELETE		=	\033[2K
DELPREV		=	$(UP)$(DELETE)\r

# EMOJI
CHECK		=	\xE2\x9C\x94

# DISPLAY
HEAD_SIZE	=	32
BODY_WIDTH	=	$(shell printf "$$(($(HEAD_SIZE) - 1))")


###########
## Rules ##
###########

.PHONY:			all bonus clean fclean header lib re verbose

all:
				@$(MAKE) -s $(NAME)
				@$(MAKE) --no-print-directory -C test_libasm all

$(BUILDIR)/%.o:	%.s | $(DEPDIR)
				@mkdir -p build/ $(addprefix build/, $(SRCS_DIR))
				@mkdir -p build/.deps/ $(addprefix build/.deps/, $(SRCS_DIR))
				@$(ASM_COMP) $(DEPFLAGS) $(ASM_FLAGS) $< -o $@

$(NAME):		$(OBJ)
				ar -rcs -o $@ $^

$(DEPDIR):
				@mkdir -p $@

$(DEP):
				-include $(wildcard $(DEP))

clean:
				@$(RM) $(OBJ)

fclean:			clean
				@$(RM) $(BUILDIR) $(NAME)
				@$(MAKE) -C test_libasm --no-print-directory fclean

bonus: all

re:				fclean
				@$(MAKE) -s all