package marshall

type OptionalBool struct {
	bool
}

func (t OptionalBool) Marshal() ([]byte, error) {
	return nil, nil
}

func (t *OptionalBool) MarshalTo(data []byte) (n int, err error) {
	return 0, nil
}

func (t *OptionalBool) Unmarshal(data []byte) error {
	return nil
}

func (t *OptionalBool) Size() int {
	return 0
}

func (t OptionalBool) MarshalJSON() ([]byte, error) {
	return nil, nil
}

func (t *OptionalBool) UnmarshalJSON(data []byte) error {
	return nil
}

// only required if the compare option is set
func (t OptionalBool) Compare(other OptionalBool) int {
	return 0
}

// only required if the equal option is set
func (t OptionalBool) Equal(other OptionalBool) bool {
	return false
}

